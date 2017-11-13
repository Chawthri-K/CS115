;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 01, Problem 1
;; ***************************************************
;
(define a 9.81)
(define (time-to-ground v h) (
     / (- v (sqrt (- (sqr v)
             (* 4 h (/ (- 0 a) 2  )))))
                 (* 2(/ (- 0 a) 2))
     ))
  
