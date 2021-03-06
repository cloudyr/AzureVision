% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/customvision_tags.R
\name{add_image_tags}
\alias{add_image_tags}
\alias{customvision_image_tags}
\alias{add_image_tags.classification_project}
\alias{remove_image_tags}
\title{Tag and untag images uploaded to a project}
\usage{
add_image_tags(project, image_ids, tags)

\method{add_image_tags}{classification_project}(project, image_ids = list_images(project, "untagged"), tags)

remove_image_tags(project, image_ids = list_images(project, "tagged", as =
  "ids"), tags = list_tags(project, as = "ids"))
}
\arguments{
\item{project}{a Custom Vision classification project.}

\item{image_ids}{The IDs of the images to tag or untag.}

\item{tags}{For \code{add_image_tags}, the tag labels to add to the images. For \code{remove_image_tags}, the tags (either text labels or IDs) to remove from images. The default for untagging is to remove all assigned tags.}
}
\value{
The vector of IDs for the images affected, invisibly.
}
\description{
Tag and untag images uploaded to a project
}
\details{
\code{add_image_tags} is for tagging images that were uploaded previously, while \code{remove_image_tags} untags them. Adding tags does not remove previously assigned ones. Similarly, removing one tag from an image leaves any other tags intact.

Tags can be specified in the following ways:
\itemize{
\item For a regular classification project (one tag per image), as a vector of strings. The tags will be applied to the images in order. If the length of the vector is 1, it will be recycled to the length of \code{image_ids}.
\item For a multilabel classification project (multiple tags per image), as a \emph{list} of vectors of strings. Each vector in the list contains the tags to be assigned to the corresponding image. If the length of the list is 1, it will be recycled to the length of \code{image_ids}.
}

If the length of the vector is 1, it will be recycled to the length of \code{image_ids}.
}
\examples{
\dontrun{

imgs <- dir("path/to/images", full.names=TRUE)
img_ids <- add_images(myproj, imgs)
add_image_tags(myproj, "mytag")
remove_image_tags(myproj, img_ids[1])
add_image_tags(myproj, img_ids[1], "myothertag")

}
}
\seealso{
\code{\link{add_images}}, \code{\link{add_tags}}

\code{\link{add_image_regions}} for object detection projects
}
