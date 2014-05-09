require 'spec_helper'

describe 'osx::global::sidebar_icon_size' do
	let(:facts) { {:boxen_user => 'ilikebees'} }

	it do
		should contain_boxen__osx_defaults('sidebar icon size').with_value(1)
	end

	describe 'with parameters' do
		let(:params) { {:size => 1} }

		it 'allows you to pass a size value' do
			should contain_boxen__osx_defaults('sidebar icon size').with({
				:domain => 'NSGlobalDomain',
				:type   => 'int',
				:key    => 'NSTableViewDefaultSizeMode',
				:value  => params[:size],
				:notify => 'Exec[killall Finder]',
				:user   => facts[:boxen_user]
			})
		end
	end
end
