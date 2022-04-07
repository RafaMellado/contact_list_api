RSpec.shared_examples 'authenticated action' do |args|
  before do
    method(args[:http_method]).call(args[:path])
  end

  it 'returns 401 Http status code' do
    expect(response).to have_http_status(401)
  end
end
