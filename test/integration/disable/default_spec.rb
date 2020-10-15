describe package 'cloud-init' do
  it { should be_installed }
end

describe file '/etc/cloud/cloud-init.disabled' do
  it { should be_file }
  it { should be_mode 0644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should eq '' }
end
