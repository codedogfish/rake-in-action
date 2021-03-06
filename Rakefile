require 'rake/clean'

Rake.application.options.trace_rules = true

SOURCE_FILES = Rake::FileList.new("sources/**/*.md","sources/**/*.markdown") do |f1|
    f1.exclude("**/~*")
    f1.exclude(/^scratch\//)
    f1.exclude do |f|
        `git ls-files #{f}`.empty?
    end
end

OUTPUT_FILES = SOURCE_FILES.pathmap("%{^sources/,outputs/}X.html")

CLEAN.include(OUTPUT_FILES)

def source_for_html(html_file)
    SOURCE_FILES.detect{|f| f.pathmap('%n') == html_file.pathmap('%n') }
end

#task :default => :html
task :default => ["book.epub","book.mobi"]

task :html => OUTPUT_FILES

LISTINGS = FileList["listings/*"]
HIGHLIGHTS = LISTINGS.ext(".html")
CLEAN.include(HIGHLIGHTS)

task :highlight => HIGHLIGHTS 

#%W[ch1.md ch2.md ch3.md].each do |md_file|
#    html_file = File.basename(md_file,".md")+".html"
#    file html_file => md_file do
#        sh "pandoc -o #{html_file} #{md_file}"
#    end
#end

rule ".html" => ->(f){source_for_html(f)} do |t|
    #puts "mkdir -p #{t.name.pathmap('%d')} > /dev/null 2>&1"
    #sh "mkdir -p #{t.name.pathmap('%d')} > /dev/null 2>&1"
    mkdir_p t.name.pathmap("%d")
    #puts "pandoc -o #{t.name} #{t.source}"
    sh "pandoc -o #{t.name} #{t.source}"
    #sh "pygmentize -o #{t.name} #{t.source}"
end

file "book.html" => OUTPUT_FILES do |t|
    chapters = FileList["outputs/ch*.html"]
    backmatter = FileList["outputs/backmatter/*.html"]
    sh "cat #{chapters} #{backmatter} > #{t.name}"
end
CLEAN.include("book.html")

file "book.epub" => "book.html" do |t|
    sh "ebook-convert book.html #{t.name}"
end
CLOBBER << "book.epub"

file "book.mobi" => "book.epub" do |t|
    sh "kindlegen book.epub -o #{t.name}"
end
CLOBBER << "book.mobi"


#rule ".html" => ".markdown" do |t|
#    sh "pandoc -o #{t.name} #{t.source}"
#end

task :clean do
    rm_rf "outputs"
end
