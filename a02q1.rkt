;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 02, Problem 1
;; ***************************************************
;;

;;HELPER FUNCTION: (years byear cyear) To determine the difference of years and convert into days
;;years:Nat Nat --> Nat
;;Example
(check-expect (years 1999 2000) 360)

(define (years byear cyear)
  (* (- cyear byear) 360))


;;HELPER FUNCTION: (months bmonth cmonth) To determine the difference of months and convert into days
;;This value may be negative, this is because the cyear > byear by 1
;;but the time elapsed may not be one full year
;;months: Nat Nat ---> Int
;;Examples
(check-expect (months 1 2) 30)
(check-expect (months 12 1) -330)

(define (months bmonth cmonth)
  (* (- cmonth bmonth) 30))


;;HELPER FUNCTION: (days bday cday): To determine the difference of days
;;This value may be negative for the similar reasons to why months may be negative
;;days: Nat Nat ---> Int
;;Examples
(check-expect (days 15 16) 1)
(check-expect (days 16 15) -1)

(define (days bday cday)
  (- cday bday))


;;days-on-earth byear bmonth bday cyear cmonth cday):To determine the number of days past between two given dates
;;Sums together the days provided by the helper functions
;;days-on-earth: Nat Nat Nat Nat Nat Nat ---> Nat
;;Examples
(check-expect (days-on-earth 0 6 1 0 6 1) 0)
(check-expect (days-on-earth 0 6 1 0 7 1) 30)

(define (days-on-earth byear bmonth bday cyear cmonth cday)
  (+ (years byear cyear) (months bmonth cmonth) (days bday cday)))


;;Tests
(check-expect (years 1999 2017) 6480)
(check-expect (months 4 8) 120)
(check-expect (months 9 6) -90)
(check-expect (days 18 30) 12)
(check-expect (days 27 3) -24)
(check-expect (days-on-earth 0 9 1 1 10 1) 390)
(check-expect (days-on-earth 0 6 1 1 2 1) 240)
(check-expect (days-on-earth 1990 6 28 1990 7 2) 4) 