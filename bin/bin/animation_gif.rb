#!/usr/bin/env ruby

require 'pathname'

input = ARGV[0]
output = Pathname.new(input).sub_ext(".gif").to_s

`ffmpeg -i #{input} -r 10 -vf scale=320:-1 #{output}`
