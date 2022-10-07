# frozen_string_literal: true

require 'spec_helper'

describe 'firebird' do
  let :node do
    'fb01.example.com'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'with all defaults' do
        it { is_expected.to compile.with_all_deps }
      end
    end
  end
end
