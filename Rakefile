# Rakefile to help automate post-related tasks.

# Y2K unix timestamp, used to create smaller timestamp identifier strings.
# This assumes new posts will all be dated with a year post-2000, otherwise the
# identifier would be negative and that's not desirable.
$Y2K = Time.new(2000, 1, 1, 0, 0, 0, 0).to_i

namespace :posts do

  desc "Create a new post with some title (required)."
  task :new, [:title] do |t, args|
    # Get the current timestamp.
    time = Time.now
    id = time.to_i - $Y2K
    title = args.title
    file = "#{time.strftime "%Y-%m-%d"}-#{title.downcase.gsub " ","-"}.markdown"
    header = <<EOS
---
layout: post
uid: #{id}
title: #{title}
date: #{time.to_s}
permalink: /posts/#{id}
---

Enter post body here...
EOS
    File.write("_posts/#{file}", header)
  end

  desc "Verify headers for all posts, ensuring required data exists"
  task :verify do
    required = [:layout, :title, :date, :uid]
    posts = Dir.entries("_posts")
    posts.each do |post|
      next if post.start_with?(".")
      attrs = []
      lines = File.readlines("_posts/#{post}")
      begun = false
      lines.each do |line|
        line = line.strip
        next if line.empty?
        if line == "---"
          break if begun
          begun = true
        elsif begun
          attrs.push(line[0, line.index(":")].to_sym)
        end
      end
      missing = []
      required.each { |r| missing.push(r) unless attrs.include?(r) }
      puts "#{post} is missing the following: #{missing.join(", ")}" unless missing.empty?
    end
  end

  desc "For posts without an id, generate the field based on publish date."
  task :fix_ids do
    posts = Dir.entries("_posts")
    posts.each do |post|
      next if post.start_with?(".")
      add_to_header("_posts/#{post}",
                           "uid",
                           lambda {|data|
                             matches = /([0-9]*)-([0-9]*)-([0-9]*) ([0-9]*):([0-9]*):([0-9]*)( [-+][0-9]*)?/.match(data['date'])
                             if matches
                               date = Time.send(:new, *matches[1, matches.length])
                               date.to_i - $Y2K
                             end})
    end
  end

  desc "For posts without a custom permalink URL, generate one based off the unique post id."
  task :fix_links do
    posts = Dir.entries("_posts")
    posts.each do |post|
      next if post.start_with?(".")
      add_to_header("_posts/#{post}",
                           "permalink",
                           lambda {|data| "/posts/#{data['uid']}"})
    end
  end

end

namespace :pages do

  desc "Create a new page using the folder method (for cleaner URLs)"
  task :new, :name do |t, args|
    name = args.name.strip
    path = name.gsub(" ", "-").downcase
    if Dir.exist?(path)
      puts "Directory '#{path}' already exists, cannot setup page '#{name}'."
    else
      Dir.mkdir(path)
      page = <<EOS
---
layout: default
title:  #{name}
---

<section id="#{path}">
  <div class="page-header">
    <h1>#{name}</h1>
  </div>

</section>
EOS
      File.write("#{path}/index.html", page)
    end
  end

end

#####################
## HELPER FUNCTIONS
#####################

require 'yaml'

def read_page(path)
  content = File.read(path)
  data = {}
  if content =~ /\A(---\s*\n.*?\n?)^(---\s*$\n?)(.*)/m
    content = $3
    data = YAML.load($1)
  end
  {content: content, data: data}
end

def write_page(path, page)
  # Psych has a poor time-to-string format (in my opinion), and this fixes that.
  header = page[:data].to_yaml + "---\n"
  header.sub!(/date: ([0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*:[0-9]*)[^ ]* ([+-][0-9]*):([0-9]*)/,
              'date: \1 \2\3')
  output = header + "\n" + page[:content]
  File.write(path, output)
end

def add_to_header(path, key, value)
  page = read_page(path)
  unless page[:data][key]
    val = value.respond_to?(:call) ? value.call(page[:data]) : value
    page[:data][key] = val
    write_page(path, page)
  end
end
