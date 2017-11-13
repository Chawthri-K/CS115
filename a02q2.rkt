;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 03, Problem 2
;; ***************************************************
;;

;;HELPER FUNCTION: (60-timbits class-size): determines the cost for packs of 60 that
;;need to be bought. Finds the smallest multiple of 60, so that excess timbits are not bought.
;;Nat ---> Nat
;;Examples
(check-expect (60-timbits 59) 0)
(check-expect (60-timbits 61) 8)

(define (60-timbits class-size)
  (* (quotient class-size 60) 8))


;;HELPER FUNCTION: (20-timbits class-size): determines the cost for packs of 20 that
;;need to be bought. Finds the smallest multiple of 20, so that excess timbits are not bought.
;;Nat ---> Nat
;;Examples
(check-expect (20-timbits 19) 0)
(check-expect (20-timbits 21) 3)
(check-expect (20-timbits 61) 0)
(check-expect (20-timbits 80) 3)

(define (20-timbits class-size)
  (* 3 (quotient (remainder class-size 60) 20)))


;;HELPER FUNCTION: (1-timbit class-size): determines the cost for single timbits that
;;need to be bought to have enough timbits for everyone
;;Nat ---> Num
;;Examples
(check-expect (1-timbit 12) 3)
(check-expect (1-timbit 80) 0)
(check-expect (1-timbit 81) 0.25)

(define (1-timbit class-size)
  (* 0.25 (remainder (remainder class-size 60) 20)))


;;(exact-cost class-size): sums together helper functions to determine cost of timbits
;;Nat--->Int
;;Examples
(check-expect (exact-cost 15) 3.75)
(check-expect (exact-cost 170) 24.5)

(define (exact-cost class-size)
  (+ (60-timbits class-size)
     (20-timbits class-size)
     (1-timbit class-size)
  ))


;;Tests
(check-expect (60-timbits 180) 24)
(check-expect (20-timbits 39) 3)
(check-expect (20-timbits 170) 6)
(check-expect (1-timbit 119) 4.75)
(check-expect (1-timbit 16) 4)
(check-expect (1-timbit 83) 0.75)