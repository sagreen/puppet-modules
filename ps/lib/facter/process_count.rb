Facter.add('process_count') do
setcode do
Facter::Util::Resolution.exec('ps -ef | wc -l')
end
end
