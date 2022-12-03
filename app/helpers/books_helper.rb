module BooksHelper
    def string_list_to_integer(list)
        if list.nil?
            return []
        end
        list.each do |a|
            result = a =~ /[0-9]/
            if result == nil
                raise Exception.new "Required numeric string"
            end
        end
        return list ? list.reject(&:empty?).map(&:to_i) : []
    end

    def query(min, max, authors)
        if authors.empty?
            if min.present? and max.empty?
                return Book.includes(:author).where("books.pages >= ?", min)
            elsif max.present? and min.empty?
                return Book.includes(:author).where("books.pages <= ?", max)
            elsif max.present? and min.present?
                return Book.includes(:author).where("books.pages between ? and ?", min, max)
            else
                return Book.includes(:author)
            end
        elsif params["authors"].present?
            return Book.includes(:author).where(author: { id: authors })
        else
            return Book.includes(:author)
        end
    end
end
