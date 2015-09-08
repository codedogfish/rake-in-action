require 'rake'

SOURCE_FILES = Rake::FileList.new("sources/**/*.md","sources/**/*.markdown") do |f1|
    f1.exclude("**/~*")
    f1.exclude(/^scratch\//)
    f1.exclude do |f|
        `git ls-files #{f}`.empty?
    end
end

puts SOURCE_FILES

OUTPUT_FILES = SOURCE_FILES.pathmap("%{^sources/,outputs/}X.html")

puts OUTPUT_FILES

def source_for_html(html_file)
    SOURCE_FILES.detect{|f| 
        #puts f.pathmap("%f")
        #puts html_file.pathmap("%f")
        #puts f.pathmap("%f") == html_file.pathmap("%f")
        f.pathmap("%n") == html_file.pathmap("%n")
    }
end

OUTPUT_FILES.each do |f|
    puts source_for_html(f)
end
