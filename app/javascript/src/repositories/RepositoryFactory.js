import MoviesRepository from "./MoviesRepository";

const repositories = {
  movies: MoviesRepository,
};

export const RepositoryFactory = {
  get: (name) => repositories[name],
};
