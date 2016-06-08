%function [V_v] = DIBR(V_o, D_o, K_o, Rt_o, K_v, Rt_v) 
clear all; close all; clc
V_o = imread('V_original.png'); % 2D original image, contains color also known as texture information
% imfinfo ('V_original.png')
D_o = imread('D_original.png'); % corresponding depth map contains normalize depth information
% imfinfo ('D_original.png')
%% Original camera parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Intrinsic parameters of original camera
K_o = [1732.87 0.0 943.23; 0.0 1729.90 548.845040; 0 0 1]; %camera calibrartion matrix
% Extrinsic parameters of original camera
Rt_o = [1.0 0.0 0.0 0; 0.0 1.0 0.0 0.0; 0.0 0.0 1.0 0.0]; % rotation and translation matrix
% depth map normalization factors 
% Znear and Zfar are nearest and fartheset points in the scene from the original camera
Zfar = 2760.510889;
Znear = 34.506386;

%% Virtual camera parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Intrinsic parameters of virtual camera
K_v = [1732.87 0.0 943.23 ;0.0 1729.90 548.845040; 0 0 1];
% Extrinsic parameters of virtual camera
Rt_v = [1.0 0.0 0.0 1.5924; 0.0 1.0 0.0 0.0; 0.0 0.0 1.0 0.0]; % rotation and translation matrix

%% Task 1: produce a synthesized 2D virtual image located at the positioned defined by the two cameras' projection matrices
%% 3D image wrapping
%rgb to ycbcr
V_o_ycbcr = rgb2ycbcr(V_o);
D_o_ycbcr = rgb2ycbcr(D_o);

%% Task 2: Arbitary number of N = 5 virtual view
