function varargout = saturation(varargin)
% SATURATION MATLAB code for saturation.fig
%      SATURATION, by itself, creates a new SATURATION or raises the existing
%      singleton*.
%
%      H = SATURATION returns the handle to a new SATURATION or the handle to
%      the existing singleton*.
%
%      SATURATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SATURATION.M with the given input arguments.
%
%      SATURATION('Property','Value',...) creates a new SATURATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before saturation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to saturation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help saturation

% Last Modified by GUIDE v2.5 23-Sep-2019 19:04:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @saturation_OpeningFcn, ...
                   'gui_OutputFcn',  @saturation_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before saturation is made visible.
function saturation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to saturation (see VARARGIN)

% Choose default command line output for saturation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes saturation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = saturation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global sat1
[FileName,FilePath]=uigetfile('*.*','Select Image');
name=strcat(FilePath,FileName);
sat1=imread(name);
axes(handles.axes1);
imshow(sat1)


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global sat1

sat2 = rgb2hsv(sat1);
sat2(:, :, 2) = sat2(:, :, 2) * 0.1;
axes(handles.axes2)
imshow(sat2)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
