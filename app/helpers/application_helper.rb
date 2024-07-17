module ApplicationHelper
  INDIA_DATE_FORMAT = I18n.t('date.formats.default')
  INDIA_TIME_FORMAT = I18n.t('time.formats.default')

  def active_class(page_name)
    if request.original_url.split('/')[3].to_s.include?(page_name)
      'active'
    end
  end

  def homepage?
    request.original_url == 'http://localhost:3000/' ? 'active' : ''
  end
end
