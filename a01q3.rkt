;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 01, Problem 3
;; ***************************************************
;
(define mypi 3.14)
(define (deg->rad deg)
     (* deg (/ mypi 180)))
(define R 6371)
(define (geo-distance lat1 long1 lat2 long2) (*
              (acos (+ (* (sin lat1) (sin lat2))
              (* (cos lat1) (cos lat2) (cos (- lat2 lat1))))) R))