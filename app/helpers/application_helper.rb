module ApplicationHelper

  def navbar_highlight(path)
    if path == current_path
      "w3-bar-item w3-button w3-padding-large w3-white"
    else
      "w3-bar-item w3-button w3-padding-large w3-hover-white"
    end
  end

  def current_path
    request.env["REQUEST_PATH"]
  end

end
