module ApplicationHelper
  def app_header
    content_tag("app-header", nil, nil, false)
  end

  def login_modal
    inner_options = {
      "ref": "loginModal",
    }

    content_tag("login-modal", nil, inner_options, false)
  end

  def upload_modal
    inner_options = {
      "ref": "uploadModal",
    }

    content_tag("upload-modal", nil, inner_options, false)
  end
end
