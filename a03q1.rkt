;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 03, Problem 1
;; ***************************************************
;;

;;(is-leap-year?): Determines if a given year is a leap year
;;given the conditions a year must meet to be a leap year
;;Num--->Bool
;;Examples
(check-expect (is-leap-year? 1999) false)
(check-expect (is-leap-year? 2000) true)


(define (is-leap-year? year)
  (cond
    [(zero? (remainder year 400)) true]
    [(zero? (remainder year 100)) false]
    [(zero? (remainder year 4)) true]
    [else false]))


;;Tests
(check-expect (is-leap-year? 1600) true)
(check-expect (is-leap-year? 1800) false)
(check-expect (is-leap-year? 2016) true)
(check-expect (is-leap-year? 2017) false)