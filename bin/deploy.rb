def rmdir_r(dir)
  Dir.chdir(dir)
  
  Dir['**/{*,.*}'].select do |f|
    n = f.split('/').last
    n != '..' and n != '.'
  end.reverse_each do |f|
    if File.directory?(f)
      Dir.delete(f)
    else
      File.delete(f)
    end
  end
  
  Dir.delete(dir)
end

def main
  dotfiles = File.join(Dir.home, '.dotfiles')
  entries = Dir.entries(dotfiles).select { |f| f[0] != '.' }
  
  existing = entries.select do |f|
    p = File.join(Dir.home, '.' + f)
    File.exists?(p) and !File.symlink?(p)
  end
  
  if !existing.empty?
    puts 'WARNING: This will overwrite the following dotfiles:'
    
    existing.each do |f|
      puts (File.directory?(f) ? 'd ' : 'f ') + f
    end
    
    print 'Are you sure you want to overwrite these files? (y/n) '
    response ||= gets
  end
  
  if !entries.empty? and response[0].downcase == 'y'
    entries.reject!{ |f| ['bin', 'README.md'].include?(f) || f[0] == '.' }.each do |f|
      p = File.join(Dir.home, '.' + f)
      if !File.symlink?(p)
        if File.exists?(p)
          if File.directory?(p)
            rmdir_r(p)
          else
            File.delete(p)
          end
          puts (File.directory?(f) ? 'd ' : 'f ') + f + ' (overwrote)'
        else
          puts (File.directory?(f) ? 'd ' : 'f ') + f + ' (wrote)'
        end
        File.symlink(File.join(dotfiles, f), p)
      end
    end
  else
    puts 'Aborting...'
  end
  puts 'Done!'
end

if __FILE__ == $0
  main
end
