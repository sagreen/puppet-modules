Facter.add('filefun') do
  setcode do
    Facter::Util::Resolution.exec('$::filefun')
  end
end

