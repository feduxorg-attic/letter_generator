Given(/^a letter named "(.*?)" does not exist$/) do |name|
  in_current_dir do
    FileUtils.rm_f name
  end
end

Then(/^a letter named "(.*?)" should exist$/) do |name|
  step %(a filed named "#{name}.tex" should exist)
end
