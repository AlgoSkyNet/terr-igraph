\name{is.multiple}
\alias{has.multiple}
\alias{is.loop}
\alias{is.multiple}
\alias{count.multiple}
\concept{Simple graph}
\title{Find the multiple or loop edges in a graph}
\description{A loop edge is an edge from a vertex to itself. An edge is
  a multiple edge if it has exactly the same head and tail vertices as
  another edge. A graph without multiple and loop edges is called a
  simple graph.}
\usage{
is.loop(graph, eids=E(graph))
has.multiple(graph)
is.multiple(graph, eids=E(graph))
count.multiple(graph, eids=E(graph))
}
\arguments{
  \item{graph}{The input graph.}
  \item{eids}{The edges to which the query is restricted. By default
    this is all edges in the graph.}
}
\details{
  \code{is.loop} decides whether the edges of the graph are loop edges.
  
  \code{has.multiple} decides whether the graph has any multiple edges.

  \code{is.multiple} decides whether the edges of the graph are multiple
  edges.

  \code{count.multiple} counts the multiplicity of each edge of a
  graph.
  
  Note that the semantics for \code{is.multiple} and
  \code{count.multiple} is different. \code{is.multiple} gives \code{TRUE}
  for all occurences of a multiple edge except for one. Ie. if there are
  three \code{i-j} edges in the graph then \code{is.multiple} returns
  \code{TRUE} for only two of them while \code{count.multiple} returns
  \sQuote{3} for all three.

  See the examples for getting rid of multiple edges while keeping their
  original multiplicity as an edge attribute.
}
\value{
  \code{has.multiple} returns a logical scalar.
  \code{is.loop} and \code{is.multiple} return a logical
  vector. \code{count.multiple} returns a numeric vector.
}
%\references{}
\author{Gabor Csardi \email{csardi.gabor@gmail.com}}
\seealso{\code{\link{simplify}} to eliminate loop and multiple edges.}
\examples{
# Loops
g <- graph( c(1,1,2,2,3,3,4,5) )
is.loop(g)

# Multiple edges
g <- barabasi.game(10, m=3, algorithm="bag")
has.multiple(g)
is.multiple(g)
count.multiple(g)
is.multiple(simplify(g))
all(count.multiple(simplify(g)) == 1)

# Direction of the edge is important
is.multiple(graph( c(1,2, 2,1) ))
is.multiple(graph( c(1,2, 2,1), dir=FALSE ))

# Remove multiple edges but keep multiplicity
g <- barabasi.game(10, m=3, algorithm="bag")
E(g)$weight <- count.multiple(g)
g <- simplify(g)
any(is.multiple(g))
E(g)$weight
}
\keyword{graphs}