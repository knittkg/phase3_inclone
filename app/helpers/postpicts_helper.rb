module PostpictsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_postpicts_path
    elsif action_name == 'edit'
      postpict_path
    end
  end
end
