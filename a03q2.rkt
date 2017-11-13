;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 03, Problem 2
;; ***************************************************
;;

(define january "JAN")
(define february "FEB")
(define march "MAR")
(define april "APR")
(define may "MAY")
(define june "JUN")
(define july "JUL")
(define august "AUG")
(define september "SEP")
(define october "OCT")
(define november "NOV")
(define december "DEC")

;;HELPER FUNCTION (year1 date): If user inputs date in format mm d yyyy, it
;;will append the string to provide yyyy.
;;Str--->Str
;;Examples
(check-expect (year1 "DEC 1 2017") 2017)
(check-expect (year1 "DEC 1 1999") 1999)


(define (year1 date) (string->number (substring date 6 10)))

;;HELPER FUNCTION (year2 date): If user inputs date in format mm dd yyyy, it
;;will append the string to provide yyyy.
;;Str--->Str
;;Examples
(check-expect (year2 "DEC 15 2017") 2017)
(check-expect (year2 "DEC 15 1999") 1999)


(define (year2 date) (string->number (substring date 7 11)))


;;HELPER FUNCTION:(check-month date): Checks the month. Implemented in determining
;;whether or not to add a day because of a leap year (even if it is a leap year,
;;function should not add a day if FEB 29 has not passed yet).
;;Str--->Bool
;;Examples
(check-expect (check-month "JAN 15 2017") false)
(check-expect (check-month "MAR 15 2017") true)

(define (check-month date) (and (not (string=? "JAN" (substring date 0 3)))
                           (not (string=? "FEB" (substring date 0 3)))))


;;(day-of-year date): Calculates the days that have past in a year based on the
;;month, the specific date and whether or not that year is a leap year
;;Str--->Nat
;;Examples
(check-expect (day-of-year "DEC 31 2017") 365)
(check-expect (day-of-year "JAN 15 2017") 15)


(define (day-of-year date)
  (+ (cond
    [(= 10 (string-length date)) (string->number (substring date 4 5))]
    [(= 11 (string-length date)) (string->number (substring date 4 6))])
     (cond
       [(string=? "JAN" (substring date 0 3)) 0]
       [(string=? "FEB" (substring date 0 3)) 31]
       [(string=? "MAR" (substring date 0 3)) 59]
       [(string=? "APR" (substring date 0 3)) 90]
       [(string=? "MAY" (substring date 0 3)) 120]
       [(string=? "JUN" (substring date 0 3)) 151]
       [(string=? "JUL" (substring date 0 3)) 181]
       [(string=? "AUG" (substring date 0 3)) 212]
       [(string=? "SEP" (substring date 0 3)) 243]
       [(string=? "OCT" (substring date 0 3)) 273]
       [(string=? "NOV" (substring date 0 3)) 304]
       [(string=? "DEC" (substring date 0 3)) 334])
     
  (cond
    [(and (= 10 (string-length date)) (check-month date))
     (cond
       [(zero? (remainder (year1 date) 400)) 1]
       [(zero? (remainder (year1 date) 100)) 0]
       [(zero? (remainder (year1 date) 4)) 1]
       [else 0])]
    
    [(and (= 11 (string-length date)) (check-month date))
     (cond
       [(zero? (remainder (year2 date) 400)) 1]
       [(zero? (remainder (year2 date) 100)) 0]
       [(zero? (remainder (year2 date) 4)) 1]
       [else 0])]
    [else 0])))


;;Tests
(check-expect (year1 "JAN 9 1356") 1356)
(check-expect (year1 "OCT 1 1999") 1999)
(check-expect (year2 "MAR 24 0241") 0241)
(check-expect (year2 "DEC 15 0009") 0009)
(check-expect (check-month "JAN 23 2017") false)
(check-expect (check-month "FEB 26 1957") false)
(check-expect (check-month "MAR 15 0001") true)
(check-expect (day-of-year "DEC 31 2017") 365)
(check-expect (day-of-year "DEC 31 2016") 366)
(check-expect (day-of-year "MAR 1 1983") 60)
(check-expect (day-of-year "JAN 15 2000") 15)
(check-expect (day-of-year "MAR 1 2000") 61)
(check-expect (day-of-year "JAN 15 2017") 15)