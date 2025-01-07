class Admin::SettingsController < Admin::BaseController
  def create
    setting_params.keys.each do |key|
      next if setting_params[key].nil?

      setting = Setting.new(var: key)
      setting.value = setting_params[key].strip
      unless setting.valid?
        @errors.merge!(setting.errors)
      end
    end

    setting_params.keys.each do |key|
      Setting.send("#{key}=", setting_params[key].strip) unless setting_params[key].nil?
    end

    redirect_to admin_settings_path, notice: "Setting was successfully updated."
  end

  private
  
  def setting_params
    params.require(:setting).permit(
      :site_name,
      :default_website_id
    )
  end
end
