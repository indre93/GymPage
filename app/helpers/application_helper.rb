module ApplicationHelper

   def link_to_in_li(link, path)
      active = 'active' if current_page?(path)
      content_tag :li, class: active do
         link_to_unless_current link, path
      end
   end

end
