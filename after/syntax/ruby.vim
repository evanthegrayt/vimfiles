" Store current syntax.
let s:previous_syntax = b:current_syntax

" TODO(ad): Refactor this, this is basically the same line repeated six times.
" wtf @past_aliou.

" Store the GraphQL syntax so it can be included below.
unlet b:current_syntax
syn include @GraphQLSyntax syntax/graphql.vim

syntax region rubyHereDocGraphQL matchgroup=Statement start=+<<\z(GQL\)+ end=+^\z1$+ contains=@GraphQLSyntax,rubyInterpolation
syntax region rubyHereDocDashGraphQL matchgroup=Statement start=+<<-\z(GQL\)+ end=+\s\+\z1$+ contains=@GraphQLSyntax,rubyInterpolation

" Since Ruby 2.3
syntax region rubyHereDocTildeGraphQL matchgroup=Statement start=+<<\~\z(GQL\)+ end=+\s\+\z1$+ contains=@GraphQLSyntax,rubyInterpolation

" Often seen in the ActiveRecord source.
syntax region rubyHereDocUnderscoreGraphQL matchgroup=Statement start=+<<_\z(GQL\)+ end=+\s\+\z1$+ contains=@GraphQLSyntax,rubyInterpolation

let b:current_syntax = s:previous_syntax
