class SoundsController < ApplicationController
  include AWS::S3
  BUCKET = 'soundfly.test'
  
  def index 
    @sounds = AWS::S3::Bucket.find(BUCKET).objects  
  end  
  def upload  
    begin  
      AWS::S3::S3Object.store(sanitize_filename(params[:mp3file].original_filename), params[:mp3file].read, BUCKET, :access => :public_read)  
      redirect_to index_path  
    rescue  
      render :text => "Couldn't complete the upload"  
    end  
  end  
  def delete  
    if (params[:sound])  
      AWS::S3::S3Object.find(params[:sound], BUCKET).delete  
      redirect_to index_path  
    else  
      render :text => "No sound was found to delete!"  
    end  
  end  
  private  
  def sanitize_filename(file_name)  
    just_filename = File.basename(file_name)  
    just_filename.sub(/[^\w\.\-]/,'_')  
  end  
end  
