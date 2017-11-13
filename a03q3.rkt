;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 03, Problem 3
;; ***************************************************
;;

(define sunday "Sunday")
(define monday "Monday")
(define tuesday "Tuesday")
(define wednesday "Wednesday")
(define thursday "Thursday")
(define friday "Friday")
(define saturday "Saturday")

;;HELPER FUNCTION (define rem x y): determines the remainder of x
;;when divided by y (used in Gauss' method).
;;Int Int ---> Int 
;;Example
(check-expect (remainder 5 2) 1)

(define (rem x y) (remainder x y))

;;HELPER FUNCTION (day year): This is Gauss' method, used in the main function
;;to determine the day.
;;Nat--->Int
;;Examples
(check-expect (day 2016) 5)
(check-expect (day 2018) 1)

(define (day year)
  (rem (+ 1 (* 5 (rem (- year 1) 4))
          (* 4 (rem (- year 1) 100))
             (* 6 (rem (- year 1) 400)))7))


;;(new-years-holiday year): Determines the day that the New Years Holiday
;;will land on. This day will always be a weekday. If New Years is on a
;;weekend, the holdiay will appear on a Monday.
;;Nat--->Str
;;Examples
(check-expect (new-years-holiday 2021) "Friday")
(check-expect (new-years-holiday 2019) "Tuesday")

(define (new-years-holiday year)
  (cond
    [(or (= (day year) 0)
         (= (day year) 1)
         (= (day year) 6)) "Monday"]
    [(= (day year) 2) "Tuesday"]
    [(= (day year) 3) "Wednesday"]
    [(= (day year) 4) "Thursday"]
    [(= (day year) 5) "Friday"]))

;;Tests
(check-expect (remainder 5 2) 1)
(check-expect (day 2000) 6)
(check-expect (day 2023) 0)
(check-expect (new-years-holiday 2016) "Friday")
(check-expect (new-years-holiday 2017) "Monday")
(check-expect (new-years-holiday 2018) "Monday")
(check-expect (new-years-holiday 2020) "Wednesday")