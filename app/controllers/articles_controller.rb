class ArticlesController < ApllicationController
  before_filter :authorize, only: [:create]
end