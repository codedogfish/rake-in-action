Rake.application.options.trace_rules = true

SOURCE_FILES = Rake::FileList.new("**/*.md","**/*.markdown") do |f1|
    f1.exclude("~*")
    f1.exclude(/^scratch\//)
    f1.exclude do |f|
        `git ls-files #{f}`.empty?
    end
end

def source_for_html(html_file)
    SOURCE_FILES.detect{|f| f.ext('') == html_file.ext('') }
end

task :default => :html

task :html => SOURCE_FILES.pathmap("%{^sources/,outputs/}X.html")

#%W[ch1.md ch2.md ch3.md].each do |md_file|
#    html_file = File.basename(md_file,".md")+".html"
#    file html_file => md_file do
#        sh "pandoc -o #{html_file} #{md_file}"
#    end
#end

rule ".html" => ->(f){source_for_html(f)} do |t|
    sh "pandoc -o #{t.name} #{t.source}"
end

#rule ".html" => ".markdown" do |t|
#    sh "pandoc -o #{t.name} #{t.source}"
#end
