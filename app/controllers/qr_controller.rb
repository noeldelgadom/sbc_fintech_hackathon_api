class QrController < ApplicationController

  def create_qr_code
  	model = User if create_qr_code_params[:type] == "User"
  	model = Company if create_qr_code_params[:type] == "Company"
  	record = model.find(create_qr_code_params[:id])
  	unique_string = "#{create_qr_code_params[:type]};#{record.id};#{record.account_number};#{create_qr_code_params[:concept]};#{create_qr_code_params[:ammount]};#{create_qr_code_params[:currency]}"
  	qrcode = RQRCode::QRCode.new(unique_string)
  	dir = Rails.root.join('public', 'qrs')
  	png = qrcode.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 360,
          border_modules: 4,
          module_px_size: 6,
          file: nil # path to write
          )
  	Dir.mkdir(dir) unless Dir.exist?(dir)
  	file_name = "qr_" + unique_string.gsub(" ","").gsub(";", "") + ".png"
  	File.open(dir.join(file_name), 'wb') do |file|
  		file.write(png.to_s)
  	end
  	return_json = {"qr_url" => "/qrs/#{file_name}"}.as_json
  	render json:return_json

  end

  private
  def create_qr_code_params
  	params.permit([:concept, :id, :ammount, :type, :currency])
  end
end