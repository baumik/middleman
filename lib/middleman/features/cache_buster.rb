class << Middleman::Base    
  alias_method :pre_cache_buster_asset_url, :asset_url
  def asset_url(path, prefix="", request=nil)
    http_path = pre_cache_buster_asset_url(path, prefix, request)
    
    if http_path.include?("://") || !%w(.css .png .jpg .js .gif).include?(File.extname(http_path))
      http_path
    else
      begin
        prefix = self.images_dir if prefix == self.http_images_path
      rescue
      end
      
      real_path = File.join(self.public, prefix, path)
      http_path << "?" + File.mtime(real_path).strftime("%s") if File.readable?(real_path)
      http_path
    end
  end
end