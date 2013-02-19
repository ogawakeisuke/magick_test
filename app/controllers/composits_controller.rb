class CompositsController < ApplicationController
  def index
  end

  def compose
    upfile = params[:upfile]
    basedir = "#{Rails.root}/public/contents/uploads/pic"

    # deplicated
    ext = File.extname(upfile.original_filename).downcase
    #epoch = Time.now.to_i

    begin
      FileUtils.mkdir_p(basedir) unless File.exists?(basedir)
      sample_image = "#{basedir}/sample2.png"
      
      dst = Magick::Image.new(128, 128)
      
      #dst = Magick::ImageList.new(upfile.tempfile.path)
      src = Magick::Image.read( sample_image ).first
      
      dst.composite(src, Magick::CenterGravity, Magick::OverCompositeOp)
      dst.write("#{basedir}/#{ext}")
      # send_file(sample_image,:type => 'image', :disposition => 'inline' )
      #send_file("#{basedir}/#{ext}")
      # render text: { msg: :ok, :url => "/contents/uploads/tmp_prefpic/#{ext}" }.to_json
    rescue => e
      logger.debug "---------"
      logger.debug e
      render text: { msg: :ng }.to_json
    end
  end

end
