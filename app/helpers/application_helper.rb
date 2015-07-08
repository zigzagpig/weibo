module ApplicationHelper
  # 根据所在的页面返回完整的标题
  def full_title(page_title = '')
    base_title = "小斗鱼"
	if page_title.include? '.无后缀'
	  page_title.delete '.无后缀'
	elsif page_title.empty?
	  base_title
	else
	  page_title + " " + base_title
	end
  end
end