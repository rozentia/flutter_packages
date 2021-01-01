import 'mocha'
import chai, { expect } from 'chai'
import SignInUseCase from '../../src/auth/SignInUseCase';
import IAuthRepository from '../../src/auth/Auth.i';
import IPasswordService from '../../src/services/PasswordService.i';

describe('SignInUseCase', () => {
    let sut: SignInUseCase
    let repository: IAuthRepository
    let passwordService: IPasswordService

    const user = {
        email: 'email@email.com',
        id: 'f34o793y0rf97pw98fywp98f',
        name: 'Nelson Friedman',
        password: 'e0ef0v8e3#%3Srf',
        type: 'email',
    }

    beforeEach(() => {
        repository = new FakeRepository()
        passwordService = new FakePasswordService()
        sut = new SignInUseCase(repository, passwordService)
    })
})