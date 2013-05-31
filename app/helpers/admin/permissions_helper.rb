module Admin::PermissionsHelper
  def permissions
    {
      "view" => "View",
      "create characters" => "Create Characters",
      "edit characters" => "Edit Characters",
      "delete characters" => "Delete Characters"
    }
  end
end

