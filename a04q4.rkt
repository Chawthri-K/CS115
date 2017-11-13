;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 04, Problem 4
;; ***************************************************
;;

;; A Book-Price is (anyof Num false), where it is a number >= 0 if the 
;;   book is available in the associated format, and false otherwise.


(define-struct book-purchase (hardcover softcover ebook))
;; A Book-Purchase is a 
;;   (make-book-purchase Book-Price Book-Price Book-Price)
;; Requires:
;;   hardcover, softcover, and ebook, are the prices of the book if it
;;     is available in the respective formats, and false otherwise.


(define-struct textbook (title online purchase))
;; A Textbook is a (make-textbook Str Str Book-Purchase), 
;; Requires:
;;   title is nonempty.
;;   online is the empty string if the textbook is not available 
;;     online; otherwise, it is the URL for the online text.
;;   purchase provides the prices for the book in hardcover, 
;;     softcover, and ebook format (if they are available).

;;(online text) produces the string 'online'.
;;online: textbook ---> Str
;;Example:
(check-expect (online (make-textbook "Google Book" "google.ca" (make-book-purchase 10 10 10))) "google.ca")

(define (online text) (textbook-online text))

;;(hardcover text) produces the net value of purchasing a hardcover textbook.
;;     which is 50% of the initial cost.
;;hardcover: textbook ---> (anyof Int false)
;;Example:
(check-expect (hardcover (make-textbook "Google Book" "google.ca" (make-book-purchase 10 10 10))) 5)

(define (hardcover text) (* 0.5 (book-purchase-hardcover (textbook-purchase text))))

;;(softcover text) produces the net value of purchasing a softcover textbook
;;     which is 70% of the initial cost.
;;softcover: textbook ---> (anyof Int false)
;;Example:
(check-expect (softcover (make-textbook "Google Book" "google.ca" (make-book-purchase 10 10 10))) 7)

(define (softcover text) (* 0.7 (book-purchase-softcover (textbook-purchase text))))

;;(ebook text) produces the net value of purchasing a ebook
;;     which is 100% of the initial cost since ebooks cannot be returned.
;;softcover: textbook ---> (anyof Int false)
;;Example:
(check-expect (ebook (make-textbook "Google Book" "google.ca" (make-book-purchase 10 10 10))) 10)

(define (ebook text) (book-purchase-ebook (textbook-purchase text)))

;;(cheapest text) produces the cheapest option of text to buy and outputs the type as a symbol.
;;     It does not include online textbook. The last two cases determine what occurs if there
;;     are two identical lowest cost. It prioritizes ebook over softcover over hardcover.
;;cheapest: textbook ---> (anyof 'hardcover 'softcover 'ebook)
;;Example:
(check-expect (cheapest (make-textbook "Google Book" "google.ca" (make-book-purchase 10 10 10))) 'hardcover)

(define (cheapest text)
  (cond [(and (< (hardcover text) (softcover text))
              (< (softcover text) (ebook text))) 'hardcover]
        [(and (< (softcover text) (hardcover text))
              (< (softcover text) (ebook text))) 'softcover]
        [(and (< (ebook text) (softcover text))
              (< (ebook text) (hardcover text))) 'ebook]
        [(or (= (ebook text) (softcover text))
             (= (ebook text) (hardcover text))
             (= (ebook text) (softcover text) (hardcover text))) 'ebook]
        [(= (softcover text) (hardcover text)) 'softcover]
        ))
              
;;(cheapest-method text): produces the cheapest form of textbook available. If the string 'online' is
;;      empty it will produce the answer provided from (cheapest text). If there is
;;      an option for a free online textbook, it will default to that option.
;;cheapest-method: textbook ---> (anyof 'online 'hardcover 'softcover 'ebook)
;;Example:
(check-expect (cheapest-method (make-textbook "Google Book" "google.ca" (make-book-purchase 10 10 10))) 'online)

(define (cheapest-method text)
  (cond [(> (string-length (online text)) 0) 'online]
        [else (cheapest text)]))

;;Tests:
(check-expect (hardcover (make-textbook "Pixel Book" "apple.ca" (make-book-purchase 15 9 13))) 7.5)
(check-expect (softcover (make-textbook "Surface Book" "microsoft.ca" (make-book-purchase 12 100 1522))) 70)
(check-expect (ebook (make-textbook "Xbox" "" (make-book-purchase 214 5124 12))) 12)
(check-expect (cheapest (make-textbook "ABCD" "" (make-book-purchase 20 10212211 12133222))) 'hardcover)
(check-expect (cheapest (make-textbook "XYZ" "xyz.ca" (make-book-purchase 12444312 11241 143122123))) 'softcover)
(check-expect (cheapest (make-textbook "HELLO" "Iphone.com" (make-book-purchase 121241 10214 1))) 'ebook)
(check-expect (cheapest-method (make-textbook "Google Book" "google.ca" (make-book-purchase 10 10 10))) 'online)
(check-expect (cheapest-method (make-textbook "Google Book" "google.ca" (make-book-purchase 12341 102 10))) 'online)
(check-expect (cheapest-method (make-textbook "Google Book" "google.ca" (make-book-purchase 10 1012312 10321))) 'online)
(check-expect (cheapest-method (make-textbook "Google Book" "" (make-book-purchase 103242 10 14320))) 'softcover)
(check-expect (cheapest-method (make-textbook "Google Book" "" (make-book-purchase 5212 10123 10))) 'ebook)
(check-expect (cheapest-method (make-textbook "Google Book" "" (make-book-purchase 10 12313 123123))) 'hardcover)
(check-expect (cheapest-method (make-textbook "Google Book" "" (make-book-purchase 50 1123120 25))) 'ebook)
(check-expect (cheapest-method (make-textbook "Google Book" "" (make-book-purchase 140 100 70))) 'ebook)
(check-expect (cheapest-method (make-textbook "Google Book" "" (make-book-purchase 213123 100 70))) 'ebook)
(check-expect (cheapest-method (make-textbook "Google Book" "" (make-book-purchase 140 100 1012))) 'softcover)

