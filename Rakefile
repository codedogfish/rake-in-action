source_files = Rake::FileList.new("**/*.md","**/*.markdown") do |f1|
    f1.exclude("~*")
    f1.exclude(/^scratch\//)
    f1.exclude do |f|
        `git ls-files #{f}`.empty?
    end
end

task :default => :html

task :html => source_files.ext(".html") 

#%W[ch1.md ch2.md ch3.md].each do |md_file|
#    html_file = File.basename(md_file,".md")+".html"
#    file html_file => md_file do
#        sh "pandoc -o #{html_file} #{md_file}"
#    end
#end
rule ".html" => ".md" do |t|
    sh "pandoc -o #{t.name} #{t.source}"
end

rule ".html" => ".markdown" do |t|
    sh "pandoc -o #{t.name} #{t.source}"
end
