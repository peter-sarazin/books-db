// book summary

select b.book_id, bt.title, bt.subtitle, b.edition, b.isbn10, b.isbn13, p.publisher_name, s.series_name from book b
left join book_title bt on bt.book_title_id = b.book_title_id
left join publisher p on p.publisher_id = b.publisher_id
left join series s on s.series_id = b.series_id

// book detail

select b.book_id, bt.title, bt.subtitle, b.edition, b.isbn10, b.isbn13, p.publisher_name, s.series_name, pe.first_name, pe.middle_name, pe.last_name,
br.name as retailer, bp.purchase_date, bp.purchase_price 
from book b
left join book_title bt on bt.book_title_id = b.book_title_id
left join publisher p on p.publisher_id = b.publisher_id
left join series s on s.series_id = b.series_id
left join book_author ba on ba.book_id = b.book_id
left join person pe on pe.person_id = ba.person_id
left join book_purchase bp on bp.book_id = b.book_id
left join book_retailer br on br.book_retailer_id = bp.book_retailer_id
where b.book_id=3