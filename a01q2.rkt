;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 01, Problem 2
;; ***************************************************
;
(define phi (/ (+ 1 (sqrt 5)) 2))
(define (fibonacci-num n) 
       (/ (- (expt phi n) (expt (- 0 (/ 1 phi)) n))
          (sqrt 5)))