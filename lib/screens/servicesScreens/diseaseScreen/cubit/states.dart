abstract class ArticleStates{}

//initial states for social layout loading ,initial ,success ,and error
class ArticleInitialState extends ArticleStates{}
class ArticleGetSuccessState extends ArticleStates{}
class UpdateArticleLoadingState extends ArticleStates{}
class UpdateArticleErrorState extends ArticleStates{}
class UpdateArticleSuccessState extends ArticleStates{}
class ChangeArticleErrorState extends ArticleStates{}
class ChangeArticleLikesSuccessState extends ArticleStates{}
class ChangeArticleViewsSuccessState extends ArticleStates{}