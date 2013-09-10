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
uid:    #{id}
title:  "#{title}"
date:   #{time.to_s}
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
      lines = File.readlines("_posts/#{post}")
      begun = false
      date = nil
      lines.each_index do |idx|
        line = lines[idx].strip
        next if line.empty?
        if line == "---"
          if begun && date
            id = date.to_i - $Y2K
            lines.insert(idx, "uid: #{id}\n")
            File.write("_posts/#{post}", lines.join(""))
            break
          end
          begun = true
        end
        if begun
          break if line.start_with?("uid:")
          if line.start_with?("date:")
            date = line[5, line.length].strip
            matches = /([0-9]*)-([0-9]*)-([0-9]*) ([0-9]*):([0-9]*):([0-9]*)( [-+][0-9]*)?/.match(date)
            if matches
              date = Time.send(:new, *matches[1, matches.length])
            end
          end
        end
      end
    end
  end

end
