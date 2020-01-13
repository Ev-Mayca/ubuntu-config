<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
### <center>vins 中值法公式详细推导</center>
#### 关键符号说明
$w_m$ vins中中值法，$[w_t , w_{t+1}]$区间的测量值
$$\tag{0} w_{m} = \frac {w_t+w_{t+1}} {2}$$
$a_m$ vins中中值法，[$a_t , a_{t+1}]$区间的测量值
$$\tag{1} a_{m} = {\frac {q_t(a_t + n_{a0}-b_{at}) + q_{t+1}{(a_{t+1}+n_{a1}-b_{at})}} {2}}$$
$a_t$ $t$ 时刻的加速度测量值  
$v_t$ $t$ 时刻的角速度测量值  
$b_{at}$ 加速度在$t$时刻的偏置  
$b_{wt}$ 角速度在$t$时刻的偏置  
$n_{at}$ 加速度在$t$时刻的高斯噪声  
$n_{wt}$ 角速度在$t$时刻的高斯噪声  
#### 0、离散系统的状态更新方程

$$p_{t+1} = p_t + v_t \delta t + \frac 1 2 \hat{a}_t\delta^2 t \tag{2}$$
$$q_{t+1} = q_t\otimes\big\{\hat{w}_t\delta t\big\}\tag{3}$$
$$v_{t+1} = v_t + a_m \delta t \tag{4}$$
$$b_{a(t+1)} = b_{at} + n_{ba}\delta t \tag{5}$$
$$b_{w(t+1)} = b_{wt} + n_{bw}\delta t \tag{6}$$
#### 1、$\delta\theta_{t+1}$ 的推导：
由参考文献2中的5.33节The error-state kinematics可知：
$$\tag{8}\delta\theta_t^{'}=-[w_m - b_w]_{\times}\delta\theta_t - \delta b_w - n_w$$ 
公式$(0)$带入公式$(7)$可得：
$$\tag{9}\delta\theta_t^{'}=-[\frac {w_t+w_{t+1}} {2}-b_{wt}]_{\times}\delta\theta_t - \delta{b_w} - \frac {n_{w0} + n_{w1}} {2}$$ 
由泰勒公式得：
$$\tag{10} \delta\theta_{t+1} = \delta\theta_t + \delta\theta_t^{'}\delta{t}$$
$$\begin{aligned}\tag{11} \delta\theta_{t+1} = \delta\theta_t + (-[\frac {w_t+w_{t+1}} {2}-b_{wt}]_{\times}\delta\theta_t - \delta{b_w} - \frac {n_{w0} + n_{w1}} {2})\delta{t}\\
=(I-[\frac {w_t+w_{t+1}} {2}-b_{wt}]_{\times}\delta{t})\delta\theta_t - \delta{b_w}\delta{t} - {\frac {n_{w0} + n_{w1}} {2}\delta}{t}\end{aligned}$$

#### 2、$\delta{v}_{t+1}$ 的推导（此处不明白t和t+1的偏置为何是t时刻的）：
由参考文献2中的5.33节The error-state kinematics可知：
$$\tag{13}\delta{v}^{'}=-R[a_m - b_a]_{\times}\delta\theta - R\delta b_a - Rn_a + \delta g$$ 
公式$(6)$带入公式$(7)$可得（此处应该是减去高斯噪声，但是对高斯噪声的加减是不是无所谓？ $n\backsim N\{0,\alpha ^2\}$）:
$$\begin{aligned}\tag{14} \delta v_t^{'}=-\frac {q_t[a_t - b_{at}]_{\times}\delta\theta_t + q_{t+1}[a_{t+1} - b_{at}]_{\times}\delta\theta_{t+1} + q_t\delta b_{at} + q_{t+1} \delta b_{a(t+1)} + q_t n_{a0} + q_{t+1}n_{a1}} {2} + \delta g \\
 =-\frac {q_t[a_t - b_{at}]_{\times}\delta\theta_t + q_{t+1}[a_{t+1} - b_{at}]_{\times}((I-[\frac {w_t+w_{t+1}} {2}-b_{wt}]_{\times}\delta{t})\delta\theta_t - \delta{b_w}\delta{t} - {\frac {n_{w0} + n_{w1}} {2}\delta}{t})} {2} - \\
  \frac {q_t\delta b_{at} + q_{t+1} \delta b_{a(t+1)} + q_t n_{a0} + q_{t+1}n_{a1}} {2} + \delta g \end{aligned}$$ 
由泰勒公式得：
$$\tag{15} \delta v_{t+1} = \delta v_t + \delta v_t^{'}\delta{t}$$
公式$(7)$带入公式$(8)$可得：
$$\begin{aligned} \tag{16} \delta v_{t+1} = &\delta v_t - \frac {q_t[a_t - b_{at}]_{\times}\delta\theta_t + q_{t+1}[a_{t+1} - b_{at}]_{\times}((I-[\frac {w_t+w_{t+1}} {2}-b_{wt}]_{\times}\delta{t})\delta\theta_t - \delta{b_w}\delta{t} - {\frac {n_{w0} + n_{w1}} {2}\delta}{t})} {2} \delta{t} \\
&-(\frac {q_t\delta b_{at} + q_{t+1} \delta b_{a(t+1)} + q_t n_{a0} + q_{t+1}n_{a1}} {2} ) \delta{t}\\
=& \delta v_t - \frac {q_t[a_t - b_{at}]_{\times}\delta\theta_t \delta{t}} {2} \\
&-q_{t+1}[a_{t+1} - b_{at}]_{\times}\frac {((I\delta{t}-[\frac {w_t+w_{t+1}} {2}-b_{wt}]_{\times}\delta^2{t})\delta\theta_t - \delta{b_w}\delta^2{t} - {\frac {n_{w0} + n_{w1}} {2}}\delta^2{t})} {2}  \\
&-\frac {q_t\delta b_{at} + q_{t+1} \delta b_{a(t+1)} + q_t n_{a0} + q_{t+1}n_{a1}} {2} \delta t \\
\end{aligned}$$
#### 3、$\delta{a}_{t+1}$ 的推导:
根据公式$(2)$
$$\tag{17}\delta a_{t+1} = \delta a_t + \delta v_t \delta t + {\frac 1 2} \delta v^{'}_t\delta^2t$$
$$\tag{18}\delta a_{t+1} = \delta a_t + \delta v_t \delta t + {\frac 1 2}()$$
$$\begin{aligned}\tag{19} \left[ \begin{array}{c}{\delta p_{k+1}} \\ {\delta q_{k+1}} \\ {\delta v_{k+1}} \\ {\delta b a_{k+1}} \\ {\delta b g_{k+1}}\end{array}\right]=
\begin{bmatrix}
{I} & {f_{01}} & {\delta t} & {-\frac{1}{4}\left(q_{k}+q_{k+1}\right) \delta t^{2}} & {f_{05}} \\ {0} & {I-\left\lfloor\frac{w_{0}+w_{1}}{2}-b g_{k}\right\rfloor_{ \times} \delta t} & {0} & {0} & {-\delta t} \\ {0} & {f_{31}} & {I} & {-\frac{q_{k}+q_{k+1}}{2} \delta t} & {f_{35}} \\ {0} & {0} & {0} & {I} & {0} \\ {0} & {0} & {0} & {0} & {I}\end{bmatrix} 
\left[ \begin{array}{c}{\delta p_{k}} \\ {\delta q_{k}} \\ {\delta v_{k}} \\ {\delta b a_{k}} \\ {\delta b g_{k}}\end{array}\right]
\\
+\left[ \begin{array}{cccccc}{\frac{1}{4} q_{k} \delta t^{2}} & {v_{01}} & {\frac{1}{4} q_{k+1} \delta t^{2}} & {v_{03}} & {0} & {0} \\ {0} & {\frac{1}{2} \delta t} & {0} & {\frac{1}{2} \delta t} & {0} & {0} \\ {\frac{1}{2} q_{k} \delta t} & {v_{31}} & {\frac{1}{2} q_{k+1} \delta t} & {v_{33}} & {0} & {0} \\ {0} & {0} & {0} & {0} & {\delta t} & {0} \\ {0} & {0} & {0} & {0} & {0} & {\delta t}\end{array}\right] \left[ \begin{array}{l}{n_{a_{0}}} \\ {n_{w_{0}}} \\ {n_{a_{1}}} \\ {n_{w_{1}}} \\ {n_{b a}} \\ {n_{b g}}\end{array}\right] \\
\def\arraystretch{1.5}\begin{array}{c} f_{01}=&\frac{-q_{k}\left\lfloor a_{0}-b a_{k}\right\rfloor_{ \times} \delta t^{2}}{4}+\frac{-q_{k+1}\left\lfloor a_{1}-b a_{k}\right\rfloor _{\times}\left(I-\left\lfloor\frac{w_{0}+w_{1}}{2}-b g_{k}\right\rfloor _{\times} \delta t\right) \delta t^{2}}{4} \\
f_{31}=&\frac{-q_{k}\left\lfloor a_{0}-b a_{k}\right\rfloor _{\times} \delta t}{2}+\frac{-q_{k+1}\left\lfloor a_{1}-b a_{k}\right\rfloor_{ \times}\left(I-\left\lfloor\frac{w_{0}+w_{1}}{2}-b g_{k}\right\rfloor _{\times} \delta t\right) \delta t}{2} \\
f_{05}=&\frac{1}{4}\left(-q_{k+1}\left\lfloor a_{1}-b a_{k}\right\rfloor_{ \times} \delta t^{2}\right)(-\delta t) \\ 
f_{35}=&\frac{1}{2}\left(-q_{k+1}\left\lfloor a_{1}-b a_{k}\right\rfloor _{\times} \delta t\right)(-\delta t) \\
v_{01}=&\frac{1}{4}\left(-q_{k+1}\left\lfloor a_{1}-b a_{k}\right\rfloor_{ \times} \delta t^{2}\right) \frac{1}{2} \delta t \\
v_{03}=&\frac{1}{4}\left(-q_{k+1}\left\lfloor a_{1}-b a_{k}\right\rfloor _{\times} \delta t^{2}\right) \frac{1}{2} \delta t \\
v_{31}=&\frac{1}{2}\left(-q_{k+1}\left\lfloor a_{1}-b a_{k}\right\rfloor_{ \times} \delta t\right) \frac{1}{2} \delta t \\
v_{33}=&\frac{1}{2}\left(-q_{k+1}\left\lfloor a_{1}-b a_{k}\right\rfloor _{\times} \delta t\right) \frac{1}{2} \delta t \end{array}\end{aligned}$$

[2] Solà J. Quaternion kinematics for the error-state KF[M] Surface and Interface Analysis. 2015.

$$\left( \begin{array}{ccc}
H_{11} & H_{12} & H_{13} \\
H_{21} & H_{22} & H_{23} \\
H_{21} & H_{22} & H_{23} 
\end{array} \right)$$
