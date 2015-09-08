task :default => :html

task :html => %W[ch1.html ch2.html ch3.html]

#%W[ch1.md ch2.md ch3.md].each do |md_file|
#    html_file = File.basename(md_file,".md")+".html"
#    file html_file => md_file do
#        sh "pandoc -o #{html_file} #{md_file}"
#    end
#end
rule ".html" => ".md" do |t|
    sh "pandoc -o #{t.name} #{t.source}"
end
