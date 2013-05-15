require 'spec_helper'
require 'omniauth-mailup'
require 'base64'

describe OmniAuth::Strategies::MailUp do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
    @request.stub(:cookies) { {} }
  end
  
  subject do
    OmniAuth::Strategies::MailUp.new(nil, @options || {}).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  it_should_behave_like 'an oauth2 strategy'

	describe '#client' do
    it 'has correct MailUp api site' do
      subject.options.client_options.site.should eq('https://services.mailup.com')
    end

    it 'has correct access token path' do
      subject.options.client_options.token_url.should eq('/Authorization/OAuth/Token')
    end

    it 'has correct authorize url' do
      subject.options.client_options.authorize_url.should eq('/Authorization/OAuth/LogOn')
    end
  end

	describe '#callback_path' do
    it 'should have the correct callback path' do
      subject.callback_path.should eq('/auth/mailup/callback')
    end
  end
  
  describe '#credentials' do
    before :each do
      @access_token = double('OAuth2::AccessToken')
      @access_token.stub(:token)
      @access_token.stub(:expires?)
      @access_token.stub(:expires_at)
      @access_token.stub(:refresh_token)
      subject.stub(:access_token) { @access_token }
    end

    it 'returns a Hash' do
      subject.credentials.should be_a(Hash)
    end

    it 'returns the token' do
      @access_token.stub(:token) { '123' }
      subject.credentials['token'].should eq('123')
    end

    it 'returns the expiry status' do
      @access_token.stub(:expires?) { true }
      subject.credentials['expires'].should eq(true)

      @access_token.stub(:expires?) { false }
      subject.credentials['expires'].should eq(false)
    end
  end
end