#!/usr/bin/env ruby

# Copy git remote url from current directory

git_command = 'git remote -v'
git_result = `#{git_command}`
if git_result.empty?
  puts "Failed to run command: '#{git_command}'"
  exit
end

url = git_result.split("\n")
  .select {|line| line.start_with?("origin")}.first
  .gsub("\t", " ")
  .split(" ")[1]

`printf #{url} | pbcopy`

puts "Copied '#{url}'"
