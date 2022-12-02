def books_seeding
    books_file = File.read(Rails.root.join("db/books.json"))
    books_data = JSON.parse(books_file)

    books_data["books"].each do |book|
        author = Author.find(book["author"])
        boook = author.books.create(
            content_name: book["content_name"],
            isbn: book["isbn"],
            original_title: book["original_title"],
            year: book["year"],
            author_name: book["author_name"],
            language_code: book["language_code"],
            category: book["category"],
            plot: book["plot"],
            copyright: book["copyright"],
            title: book["title"],
            average_rating: book["average_rating"],
            rating_count: book["rating_count"],
            description: book["description"],
            loc_class: book["loc_class"],
            pages: book["pages"],
            language: book["language"],
            countries: book["countries"],
            release_date: book["release_date"] ? book["release_date"].to_datetime : nil,
            cover: book["cover"],
            summary: book["summary"],
            content_cleaned: book["content_cleaned"],
            content_available: book["content_available"],
            n_authors: book["n_authors"]
        )

        if book["images_urls"]
            book["images_urls"].each do |images_url|
                boook.image_urls.create(url: images_url)
            end
        end

        if book["images"]
            book["images"].each do |image|
                boook.images.create(url: image)
            end
        end

        if book["genres"]
            book["genres"].each do |genre|
                genre = Genre.find_by(genre: genre)
                unless genre
                    genre = Genre.create(genre: genre)
                    BookGenre.create(book_id: boook.id, genre_id: genre.id)
                else
                    BookGenre.create(book_id: boook.id, genre_id: genre.id)
                end
            end
        end

        if book["wikipedia"]
            boook.book_wikipedium = BookWikipedium.create(
                url: book["wikipedia"]["url"],
                found: book["wikipedia"]["found"],
                year: book["wikipedia"]["year"]
            )
        end

        if book["goodreads"]
            boook.good_read = GoodRead.create(
                url: book["goodreads"]["url"],
                found: book["goodreads"]["found"],
                year: book["goodreads"]["year"],
            )
        end

        if book["gutenberg"]
            boook.gutenberg = Gutenberg.create(
                url: book["gutenberg"]["url"],
                num: book["gutenberg"]["num"]
            )
        end

        if book["classes"]
            book["classes"].each do |clss|
                tag = Tag.find_by(name: clss)
                unless tag
                    tag = Tag.create(name: clss)
                    BookTag.create(book_id: boook.id, tag_id: tag.id)
                else
                    BookTag.create(book_id: boook.id, tag_id: tag.id)
                end
            end
        end

        if book["similar_books"]
            book["similar_books"].each do |similar_book|
                another_book = AnotherBook.find_by(name: similar_book)
                unless another_book
                    another_book = AnotherBook.create(name: similar_book)
                    SimilarBook.create(book_id: boook.id, another_book_id: another_book.id)
                else
                    SimilarBook.create(book_id: boook.id, another_book_id: another_book.id)
                end
            end
        end
    end
end