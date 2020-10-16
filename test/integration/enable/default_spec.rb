describe package 'cloud-init' do
  it { should be_installed }
end

describe file '/etc/cloud/cloud-init.disabled' do
  it { should_not exist }
end
