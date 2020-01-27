# https://julialang.org/blog/2019/01/fluxdiffeq/
# Lookup Flux Machine Learning Framework, Gen

# Three ways to model nonlinear transformations: direct modeling, machine learning and differential equations
# problem direct modeling: many relations are not known a priori
# problem ML: learn everything from data, but maybe we have a priori knowledge about non linearity which is not considered
# DE are constrained with prior domain specific knowledge of relations


using DifferentialEquations
function lotka_volterra(du,u,p,t)
  x, y = u
    α, β, δ, γ = p
    du[1] = dx = α*x - β*x*y
    du[2] = dy = -δ*y + γ*x*y
end
u0 = [1.0,1.0]
tspan = (0.0,10.0)
p = [1.5,1.0,3.0,1.0]
prob = ODEProblem(lotka_volterra,u0,tspan,p)

sol = solve(prob)
using Plots
plot(sol, show=true)
# solvers can be controlled
# reltol (tolerance): more correct result with more timesteps
# saveat: save every .. time points
# Tsit5: 5th order Tsitouras solver

#sol = solve(prob, Tsit5(), saveat=0.1)
#sol = solve(prob, Tsit5(), saveat=0.1)
#A = sol[1,:] # length 101 vector

